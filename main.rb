require 'json'

data = File.read('./timeSlots.json')
slots = JSON.parse(data)

bSlots = []

slots = slots.sort_by.with_index { |h,i| h["startTime"] }

def slotter startTime, endTime, slots, hasFilter, extraSlots = nil
  (startTime...endTime).each do |i|
    output = {
      "startTime" => i,
      "endTime" => i+1,
    }
    if hasFilter
      slots << output if !(extraSlots.include? output)
    else
      slots << output
    end
  end
end

slots.each do |slot|
  slotter slot["startTime"], slot["endTime"], bSlots, false
end
bSlots = bSlots.uniq

availableSlots = []

slotter bSlots.first["startTime"], bSlots.last["endTime"], availableSlots, true, bSlots

p availableSlots
