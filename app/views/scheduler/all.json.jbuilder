json.array!(@schedulers) do |scheduler|
  json.id scheduler.id
  json.text scheduler.context
  json.details scheduler.details
  json.start_date scheduler.start_date.strftime('%Y-%m-%d %H-%M')
  json.end_date scheduler.end_date.strftime('%Y-%m-%d %H-%M')
end