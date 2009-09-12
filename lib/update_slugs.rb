module UpdateSlugs
    def update_slugs
        slugs = Slug.all(:conditions => {
            "seo_object_type" => self.class.to_s.tableize,
            "seo_object_id" => self.id
        })
        for slug in slugs do
            slug.save!
        end
    end

    def create_slugs
        unless defined? self.class::PatternNames
            pattern_names = [SeoPattern::DefaultPatternName]
        else
            pattern_names = self.class::PatternNames
        end
        for pattern_name in pattern_names do
            pattern = SeoPattern.find_pattern(self.class, pattern_name)
            Slug.create! :seo_object => self, :seo_pattern => pattern
        end
    end

    def destroy_slugs
        slugs = Slug.all(:conditions => {
            "seo_object_type" => self.class.to_s.tableize,
            "seo_object_id" => self.id
        })
        for slug in slugs do
            slug.destroy
        end
    end
end
