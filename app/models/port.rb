class Port < ApplicationRecord
  def sync_work
    while busy
      sleep 500
    end
    update!(busy: true)
    yeald
    update!(busy: false)
  end
end
