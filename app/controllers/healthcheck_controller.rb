class HealthcheckController < ApplicationController
    def healthcheck
        head :ok
    end
end