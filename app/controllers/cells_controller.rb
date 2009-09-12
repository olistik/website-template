class CellsController < ApplicationController
    def ajax_load
        render :inline => render_cell(params[:cell], params[:state], params[:options])
    end
end
