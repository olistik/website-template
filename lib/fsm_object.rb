module FsmObject
    def current_state_template()
        return self.current_state.to_s.downcase + ".html.erb"
    end

    def apply_event(event)
        self.send(event + "!")
    end
end
