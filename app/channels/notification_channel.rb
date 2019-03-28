class NotificationChannel < ApplicationCable::Channel


  
  def subscribed
    stream_from current_user.id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_msg(data)
    info = data['message'].split(",")
    if info[0] === 'inv'
      @orderInvitationId = Order.last(1)[0].id
      ActionCable.server.broadcast info[1], message:info[0]+","+info[2]+","+current_user.id.to_s+","+@orderInvitationId.to_s
      elsif info[0] === 'join'
      ActionCable.server.broadcast info[1], message:info[0]+","+info[2]+","+info[3]+","+info[4]
    end
      
        
      
    
  end
end
