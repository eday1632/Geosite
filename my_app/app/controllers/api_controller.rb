class ApiController < ApplicationController
    def index

        @requests = Request.select(:time).order(time: :desc).limit(10)

        @date = current_date
        @cpuinfo = cpu_info
    end

    def show
        @request = Request.find(params[:id])
    end

    def new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end

    private
        def current_date
            # t = Thread.new { exec('date') }
            # t.join
            `date`
        end

        def cpu_info
            # Thread.new { exec('cat /proc/cpuinfo') }
            # %x|cat /proc/cpuinfo|
            %x|cat /Users/ericday/Documents/junk|
        end
end

