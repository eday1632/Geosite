class ApiController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        curr_req = Request.new(:req_type => request.method)
        curr_req.save

        @requests = Request.select(:created_at).order(created_at: :desc).limit(10)

        @date = current_date
        @cpuinfo = cpu_info
    end

    def show
        @request = Request.find(params[:id])
    end

    def create
        @request = Request.find(params[:id])
        @request.update(request_params)
    end

    def update
        render :text => '405 Method Not Allowed', :status => 405
    end

    def destroy
        @request = Request.find(params[:id])
        @request.destroy
    end

    private
        def request_params
            params.require(:request).permit(:comment)
        end

        def current_date
            # tbd: tradeoffs between blocking, new thread, new proc
            # super easily crashed?
            `date`
        end

        def cpu_info
            # tbd: tradeoffs between blocking, new thread, new proc

            # %x|cat /proc/cpuinfo|
            %x|cat /Users/ericday/Documents/junk|
        end

        # copied func from tutorial
        def record_not_found
            render :text => "404 Not Found", :status => 404
        end

end

