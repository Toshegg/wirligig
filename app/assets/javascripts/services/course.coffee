course = ['$resource', ($resource) ->
  $resource '/api/courses/:id.json', { id: '@id' },
    index:
      method:  'GET'
      isArray: true
      responseType: 'json'
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data?.courses

    show:
      method:  'GET'
      isArray: false
      responseType: 'json'
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data?.course
   
    create:
      method:  'POST'
      isArray: false
      responseType: 'json'
      transformRequest: (data) ->
        angular.toJson(course: data)
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data.errors || data.course

    update:
      method:  'PUT'
      isArray: false
      responseType: 'json'
      transformRequest: (data) ->
        angular.toJson(course: data)
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data.errors || data.course
    
    destroy:
      method:  'DELETE'
      isArray: false
      responseType: 'json'
]

angular.module('students').factory('Course', course)
