require 'csv'

class Import < ApplicationRecord

  self.inheritance_column = nil
  has_attached_file :file
  validates_attachment_file_name :file, matches: [/csv\z/]

  enum type: [ :referral, :outcome ]
  enum step: [ :review, :errors, :completed ]

  before_post_process :skip_post_process

  validates :type, inclusion: { in: self.types.keys }

  def skip_post_process
    false
  end

  def save_outcome
    content = parse_file

    content.matching_participant.each { |i, data| build_data(data) }
    self.result = { updated: content.matching_participant.count }
  end

  def save_referral
    content = parse_file

    content.valid_referral.each { |i, data| build_data(data) }
    self.result = { created: content.new_participant.count, updated: content.existing_participant.count, with_warnings: content.total_warnings }
  end

  def parse_file
    Importer::Parser.new(file, type).parse
  end

  def save_data
    transaction do
      begin
        send("save_#{type}")
        self.step = 'completed'
        save!
      rescue => e
        Rails.logger.debug e
        Rails.logger.debug e.backtrace.join("\n")
        return false
      end
    end
  end

  def build_data(data)
    participant = data[:participant]
    participant.save!

    Demographic.create!(data[:demographic].merge(person_id: participant.id)) if data[:demographic]
    participant.questionnaires.create!(content: data[:questionnaire], import_id: self.id)

  end

end
