json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :fec_fedback, :description, :user_id, :reserve_parking_id 
  json.url feedback_url(feedback, format: :json)
end
