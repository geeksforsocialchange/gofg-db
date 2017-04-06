require 'test_helper'

class PeersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peer = create(:peer)
  end

  test "should get index" do
    get peers_url
    assert_response :success
  end

  test "should get new" do
    get new_peer_url
    assert_response :success
  end

  test "should create peer" do
    assert_difference('Peer.count') do
      post peers_url, params: { peer: { mentor_id: @peer.mentor_id, notes: @peer.notes, participant_id: @peer.participant_id, peer_end: @peer.peer_end, peer_start: @peer.peer_start } }
    end

    assert_redirected_to peer_url(Peer.last)
  end

  test "should show peer" do
    get peer_url(@peer)
    assert_response :success
  end

  test "should get edit" do
    get edit_peer_url(@peer)
    assert_response :success
  end

  test "should update peer" do
    patch peer_url(@peer), params: { peer: { mentor_id: @peer.mentor_id, notes: @peer.notes, participant_id: @peer.participant_id, peer_end: @peer.peer_end, peer_start: @peer.peer_start } }
    assert_redirected_to peer_url(@peer)
  end

  test "should destroy peer" do
    assert_difference('Peer.count', -1) do
      delete peer_url(@peer)
    end

    assert_redirected_to peers_url
  end
end
