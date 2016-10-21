module NightsHelper

  def notes_array(night)
    notes = night.notes.split("<br>") 
  end

  def logs_array(night)
    logs = night.logs.split("<br>") 
  end
end
