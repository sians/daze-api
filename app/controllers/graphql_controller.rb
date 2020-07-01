class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]

    # if defined?(current_user)
    #   context = { current_user: current_user }
    # end


    # if request.headers[:uid]
    #   user = User.find_by(uid: request.headers[:uid])
    #   expiry = user.tokens[request.headers[:client]]['expiry']
    #   if user &&
    #     user.tokens.key?(request.headers[:client]) &&
    #     expiry > DateTime.now.to_time.to_i
    #       current_user = user
    #   end
    # end

    # if defined?(current_user)
    #   # binding.pry
    #   context = { current_user: current_user }
    #   result = DazeApiSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    # else
    #   result = DazeApiSchema.execute(query, variables: variables, context: graphql_context(:user), operation_name: operation_name)
    # end
    binding.pry
    result = DazeApiSchema.execute(query, variables: variables, context: graphql_context(:user), operation_name: operation_name)
    # result = DazeApiSchema.execute(query, variables: variables, context: context, operation_name: operation_name)

    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end
end
