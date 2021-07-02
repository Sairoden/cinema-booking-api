require 'search_object/plugin/graphql'
require 'graphql/query_resolver'

class Resolvers::MoviesSearch < GraphQL::Schema::Resolver
  include SearchObject.module(:graphql)

  scope { Movie.all }

  type [Types::MovieType]

  class MovieFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :description_contains, String, required: false
    argument :title_contains, String, required: false
  end

  class MovieOrderBy < ::Types::BaseEnum
    value 'createdAt_ASC'
    value 'createdAt_DESC'
  end

  option :filter, type: MovieFilter, with: :apply_filter
  option :first, type: types.Int, with: :apply_first
  option :skip, type: types.Int, with: :apply_skip
  option :orderBy, type: MovieOrderBy, default: 'createdAt_DESC'

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Movie.all
    scope = scope.where('description LIKE ?', "%#{value[:description_contains]}%") if value[:description_contains]
    scope = scope.where('title LIKE ?', "%#{value[:title_contains]}%") if value[:title_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end

  def apply_first(scope, value)
    scope.limit(value)
  end

  def apply_skip(scope, value)
    scope.offset(value)
  end

  def apply_order_by_with_created_at_asc(scope)
    scope.order('created_at ASC')
  end

  def apply_order_by_with_created_at_desc(scope)
    scope.order('created_at DESC')
  end

  def fetch_results
    # NOTE: Don't run QueryResolver during tests
    return super unless context.present?

    GraphQL::QueryResolver.run(Movie, context, Types::MovieType) do
      super
    end
  end
end