class CellLayoutsController < ResourceController::Base
    [create, update, destroy].each do |action|
        action.wants.html {redirect_to collection_path}
    end
end
