class HeatingCord < ApplicationRecord
  HEATIN_CORD_OFF_MODE = 0
  HEATIN_CORD_MANUAL_ON_MODE = 1
  HEATIN_CORD_AUTOMATIC_MODE = 10

  def set_mode(mode)
    update!(mode: mode)
  end


end
