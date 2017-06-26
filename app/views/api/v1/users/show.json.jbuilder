json.user do
  json.id @user.id
  json.href api_v1_user_url(@user)
  json.mail @user.mail
  json.name @user.name
  json.username @user.username
  json.role @user.role
  json.amount @user.amount
end