class ExportJob < ApplicationJob
    def perform
        update_stage 'Faccio cose'
        update_progress_max 10
        for i in [0..10]
            sleep(2)
            update_progress
        end
    end
end