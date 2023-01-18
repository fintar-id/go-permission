# TODO

## Example

```go
//go gin
r := gin.Default()

roleAdmin := r.Use(roles([]string{"1"}))
roleAdmin.GET("/product/:id", func(c *gin.Context) {
//fmt.Println("pass")
 c.JSON(200, "admin pass")
})

r.Run(":8080")

```

## Setup
- [ ] Migration
- [ ] Config file
- [ ] TODO...

## Support database
- [ ] Mysql
- [ ] Posgresql
- [ ] Sqlite
- [ ] Etc...

## Framework Support
- [ ] Go GIN
- [ ] Echo
- [ ] Etc...