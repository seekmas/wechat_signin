json.card do |card|

  json.id @card.id
  json.name @card.name
  json.age @card.age
  json.city @card.city
  json.signature @card.signature
  json.start ((Date.today - @card.start.to_date)/365).round
  json.info @card.inspect

end