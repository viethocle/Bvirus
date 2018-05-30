json.virus @virus.each do |group| 
    json.id group["id"]
    json.key group["key"]
    json.profile group["profile"]
    json.risk_assessment group["risk_assessment"]
    json.date_discovered group["date_discovered"]
    json.date_added group["date_added"]
    json.origin group["origin"]
    json.length group["length"]
    json.type_virus group["type_virus"]
    json.subtype group["subtype"]
    json.dat_required group["dat_required"]
    json.description group["description"]
  end
  json.total @total