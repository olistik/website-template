class FormCell < Cell::Base
    def observe_select
        @source = @opts[:source]
        @update = @opts[:update]
        @param_name = @opts[:param_name]
        @url = @opts[:url]
        nil
    end
end
