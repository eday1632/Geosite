class ApiController < ApplicationController
    def index
        curr_req = Request.new()
        curr_req.req_type = request.method
        curr_req.save

        @requests = Request.select(:created_at).order(created_at: :desc).limit(10)

        @date = current_date
        @cpuinfo = cpu_info

        @test_req = request.env

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

