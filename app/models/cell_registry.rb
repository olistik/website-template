# cell_class = Cell::Base::class_from_cell_name(cell)
# use cell_class.instance_methods(false)
# to obtain the cell's list of available actions

class CellRegistry
    @@registry = []

    def self.registry
        register_all if @@registry.empty?
        @@registry
    end

    def self.registry=(r)
        @@registry = r
    end

    def self.register(cell)
        @@registry.push(cell)
    end

    def self.unregister(cell = nil)
        return @@registry.pop unless cell
        @@registry.delete(cell)
    end

    def self.actions_by_cell(cell)
        Cell::Base::class_from_cell_name(cell).instance_methods(false)
    end

    def self.register_all
        cells_paths = RAILS_ROOT + "/app/cells"
        @possible_cells = []
        paths = cells_paths.select { |path| File.directory?(path) && path != "." }
        seen_paths = Hash.new {|h, k| h[k] = true; false}
        ActionController::Routing::normalize_paths(paths).each do |load_path|
            Dir["#{load_path}/**/*_cell.rb"].collect do |path|
                next if seen_paths[path.gsub(%r{^\.[/\\]}, "")]
                cell_name = path[(load_path.length + 1)..-1]
                cell_name.gsub!(/_cell\.rb\Z/, '')
                @possible_cells << cell_name
            end
        end
        @possible_cells.uniq!
        #TODO register only some kind of cells
        for cell in @possible_cells do
        #    cell_class = Cell::Base::class_from_cell_name(cell)
             register(cell)
        end
    end
end

