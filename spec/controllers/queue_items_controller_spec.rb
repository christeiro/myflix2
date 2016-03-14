require 'spec_helper'

describe QueueItemsController do
  describe "GET index" do
    it "sets @queue_items to the queue items of the logged in user" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      queue_item1 = Fabricate(:queue_item, user: user)
      queue_item2 = Fabricate(:queue_item, user: user)
      get :index
      expect(assigns(:queue_items)).to match_array([queue_item1,queue_item2])
    end
    it "redirects to the sign in page for unauthenticated user" do
      get :index
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "POST create" do
    it "redirects to the my queue page" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      post :create, video_id: video.id
      expect(response).to redirect_to my_queue_path
    end
    it "creates a queue item" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      post :create, video_id: video.id
      expect(QueueItem.count).to eq(1)
    end
    it "creates the queue item that is associated with the video" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      post :create, video_id: video.id
      expect(QueueItem.first.video).to eq(video)
    end
    it "creates the queue item that is associated with the sign in user" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      video = Fabricate(:video)
      post :create, video_id: video.id
      expect(QueueItem.first.user).to eq(user)
    end
    it "puts the video as the last one in the queue" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      monk = Fabricate(:video)
      Fabricate(:queue_item, video: monk, user: user)
      futurama = Fabricate(:video)
      post :create, video_id: futurama.id
      futurama_queue_item = QueueItem.where(video_id: futurama.id, user_id: user.id).first
      expect(futurama_queue_item.position).to eq(2)
    end
    it "does not add the video to the queue if the video is already in the queue" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      monk = Fabricate(:video)
      Fabricate(:queue_item, video: monk, user: user)
      post :create, video_id: monk.id
      expect(user.queue_items.count).to eq(1)
    end
    it "redirects to the sign in page for unauthenticated users" do
      post :create, video_id: 3
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "DELETE destroy" do
    it "should redirect to the my queue page" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      queue_item = Fabricate(:queue_item)
      delete :destroy, id: queue_item.id
      expect(response).to redirect_to my_queue_path
    end
    it "deletes the queue item" do
      user = Fabricate(:user)
      other_user = Fabricate(:user)
      session[:user_id] = user.id
      queue_item = Fabricate(:queue_item, user: other_user)
      delete :destroy, id: queue_item.id
      expect(QueueItem.count).to eq(1)
    end
    it "does not delete the queue item if the queue item is not in the current users queue" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      queue_item = Fabricate(:queue_item, user: user)
      delete :destroy, id: queue_item.id
      expect(QueueItem.count).to eq(0)
    end
    it "redirects to the sign in page for unauthenticated users" do
      delete :destroy, id: 1
      expect(response).to redirect_to sign_in_path
    end
  end
end 