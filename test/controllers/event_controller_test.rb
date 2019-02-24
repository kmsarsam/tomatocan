require 'test_helper'
class EventsControllerTest < ActionController::TestCase
    setup do
    @event = events(:one)
    end

    test "should retrieve list of all events"do
        get :index
        assert_response :success
    end
#test "should show event" do
# sign_in users(:one)
#  get :show, params: {id: @event}
#   assert_response :success
#  end
    test "should get new event" do
        sign_in users(:one)
        get :new
        assert_response :success
    end
    test "should get past events" do
        get :pastevents, params: {permalink: 'user1'}
        assert_response :success
    end
    test "should get edit if user is signed in" do
        sign_in users(:one)
        get :edit, params: { id: @event.id }
        assert_response :success
    end
    test "should create events" do
        sign_in users(:one)
         assert_difference('Event.count', 1) do
             post :create, params: { event: { usrid: '1', name: 'Phineas' } }
             #     assert_redirected_to event_path(@event.id)
         end
         
    end
test "should redirect if events are created" do
    sign_in users(:one)
        post :create, params: { event: { usrid: '1', name: 'Phineas' } }
        # assert_redirected_to events_path(users(:one).event)

end
test "should redirect if events are not saved" do
    sign_in users(:one)
    post :create, params: { event: { usrid: '1', name: 'Phineas' } }
    assert_redirected_to new_event_path(@event)
    
end
    test "should update user's events" do
        sign_in users(:one)
        patch :update, params: {id: @event.id, event: {usrid: '1', name: 'Phineas' }}
        assert_redirected_to event_path(@event.id)
    end
    test "" do
        
    end
end
