from flask import escape


def hello_world(request):
    """HTTP Cloud Function.

    Args:
        request (flask.Request): The request object.
            For more information, see https://flask.palletsprojects.com/api/#flask.Request.

    Returns:
        The response text, or any set of values that can be turned into a Response object using `make_response`
    """
    request_args = request.args
    if request_args and 'name' in request_args:
        name = escape(request_args['name'])
    else:
        name = 'World'

    return f'Hello, {name}!'