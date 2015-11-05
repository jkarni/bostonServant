
function getanint(onSuccess, onError)
{
  $.ajax(
    { url: '/anint'
    , success: onSuccess
    , error: onError
    , type: 'GET'
    });
}

function postanint(body, onSuccess, onError)
{
  $.ajax(
    { url: '/anint'
    , success: onSuccess
    , data: JSON.stringify(body)
    , contentType: 'application/json'
    , error: onError
    , type: 'POST'
    });
}
