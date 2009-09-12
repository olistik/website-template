class CellManagementCell < Cell::Base
    def selection
        @cell_action = @opts[:cell_action]
        @cell_containers = CellContainer.all_for_select
        if @cell_action
            @cell_container = @cell_action.cell_container
            @cell_actions = CellRegistry::actions_by_cell(@cell_container.name)
        else
            @cell_actions = []
        end
        nil
    end
end

