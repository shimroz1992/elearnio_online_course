## OnlineCourse API

#### Requirements

- ruby-2.6.5 
- postgres

#### Installation

```
  $ bundle
  $ rails db:create db:migrate db:seed
```

#### Running locally

Rails app:

```
  $ rails s -p 3000 
```
### Running Test

```
$ rspec

```

* Api with request and response
  
  * Create Author

    * POST localhost:3000/users with parameter name and user-type author as shown in example 

      Ex Request: curl --location --request POST 'localhost:3000/users' \
          --header 'Content-Type: application/vnd.api+json' \
          --header 'Accept: application/vnd.api+json' \
          --data-raw ' {
                  "data":{
                      "type": "users",
                      "attributes":{
                      "name": "author user",
                          "user-type": "author"
                      }
                  }
              }
      Response:
        {
          "data": {
              "id": "11",
              "type": "users",
              "links": {
                  "self": "http://localhost:3000/users/11"
              },
              "attributes": {
                  "name": "author user",
                  "user-type": "author"
              },
              "relationships": {
                  "enrollments": {
                      "links": {
                          "self": "http://localhost:3000/users/11/relationships/enrollments",
                          "related": "http://localhost:3000/users/11/enrollments"
                      }
                  },
                  "courses": {
                      "links": {
                          "self": "http://localhost:3000/users/11/relationships/courses",
                          "related": "http://localhost:3000/users/11/courses"
                      }
                  }
              }
          }
        }
  
  * Create Talent

    * POST localhost:3000/users with parameter name and user-type talent as shown in example

      Ex Request: 
        curl --location --request POST 'localhost:3000/users' \
        --header 'Content-Type: application/vnd.api+json' \
        --header 'Accept: application/vnd.api+json' \
        --data-raw '{
            "data":{
                "type": "users",
                "attributes":{
                   "name": "talent user",
                    "user-type": "talent"
                }
            }
        }
      Response:
        {
          "data": {
              "id": "6",
              "type": "users",
              "links": {
                  "self": "http://localhost:3000/users/6"
              },
              "attributes": {
                  "name": "talent user",
                  "user-type": "talent"
              },
              "relationships": {
                  "enrollments": {
                      "links": {
                          "self": "http://localhost:3000/users/6/relationships/enrollments",
                          "related": "http://localhost:3000/users/6/enrollments"
                      }
                  },
                  "courses": {
                      "links": {
                          "self": "http://localhost:3000/users/6/relationships/courses",
                          "related": "http://localhost:3000/users/6/courses"
                      }
                  }
              }
          }
        }

  * Create Course

    * POST localhost:3000/course with parameter author in body as shows in example
      
      Ex Request:

      curl --location --request POST 'localhost:3000/courses' \
      --header 'Accept: application/vnd.api+json' \
      --header 'Content-Type: application/vnd.api+json' \
      --data-raw '{
          "data":{
              "type": "courses",
              "relationships":{
                  "author":{
                      "data":{
                          "type":"users",
                          "id": "6"
                      }
                  }
              },
              "attributes":{
                  "title": "course name",
                  "description": "test description"
              }
          }
      }

      Response:
      {
        "data": {
            "id": "6",
            "type": "courses",
            "links": {
                "self": "http://localhost:3000/courses/6"
            },
            "attributes": {
                "title": "course name",
                "description": "test description"
            },
            "relationships": {
                "enrollments": {
                    "links": {
                        "self": "http://localhost:3000/courses/6/relationships/enrollments",
                        "related": "http://localhost:3000/courses/6/enrollments"
                    }
                },
                "courses": {
                    "links": {
                        "self": "http://localhost:3000/courses/6/relationships/courses",
                        "related": "http://localhost:3000/courses/6/courses"
                    }
                },
                "author": {
                    "links": {
                        "self": "http://localhost:3000/courses/6/relationships/author",
                        "related": "http://localhost:3000/courses/6/author"
                    }
                }
            }
        }
     }


  * Enroll to course
  
    * POST localhost:3000/enrollments  to enroll talent to course with user_id and course_id

      Ex Request:

      curl --location --request POST 'localhost:3000/enrollments' \
      --header 'Content-Type: application/vnd.api+json' \
      --header 'Accept: application/vnd.api+json' \
      --data-raw '{
          "data":{
              "type":"enrollments",
              "attributes":{
                  "user-id": "5",
                  "course-id":"1"
              }
          }
      }

      Response:

      {
        "data": {
            "id": "8",
            "type": "enrollments",
            "links": {
                "self": "http://localhost:3000/enrollments/8"
            },
            "attributes": {
                "user-id": 5,
                "course-id": 1
            },
            "relationships": {
                "course": {
                    "links": {
                        "self": "http://localhost:3000/enrollments/8/relationships/course",
                        "related": "http://localhost:3000/enrollments/8/course"
                    }
                },
                "user": {
                    "links": {
                        "self": "http://localhost:3000/enrollments/8/relationships/user",
                        "related": "http://localhost:3000/enrollments/8/user"
                    }
                }
            }
        }
      }

  * Destory Author
   
    * DELETE  localhost:3000/users/:user_id to destroy author, then courses of that author will transfer to other  author

    Ex Request:

      curl --location --request DELETE 'localhost:3000/users/9' \
      --header 'Accept: application/vnd.api+json' \
      --header 'Content-Type: application/vnd.api+json' \

  
  * Get all authors

    * GET localhost:3000/users?filter[user-type]=author get all authors

    Ex Request: 
      curl --location -g --request GET 'localhost:3000/users?filter[user-type]=author' \  
      --header 'Accept: application/vnd.api+json' \
      --header 'Content-Type: application/vnd.api+json' \   

  * Get all talents

    * GET localhost:3000/users?filter[user-type]=author get all authors

    Ex Request: 
      curl --location -g --request GET 'localhost:3000/users?filter[user-type]=talent' \  
      --header 'Accept: application/vnd.api+json' \
      --header 'Content-Type: application/vnd.api+json' \   

  * Get all Courses

    * GET localhost:3000/courses get all courses

    Ex Request: 
      curl --location --request GET 'localhost:3000/courses' \
      --header 'Accept: application/vnd.api+json' \
      --header 'Content-Type: application/vnd.api+json' \    

  * Get course

    * GET localhost:3000/courses/1 get a course details

    Ex Request: 
      curl --location --request GET 'localhost:3000/courses' \
      --header 'Accept: application/vnd.api+json' \
      --header 'Content-Type: application/vnd.api+json' \      


