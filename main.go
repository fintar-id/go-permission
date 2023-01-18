package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"net/http"
)

func main() {
	fmt.Println("test")
	//initDB()
	r := gin.Default()

	//r.Use(roles())
	roleAdmin := r.Use(roles([]string{"1"}))
	roleAdmin.GET("/test/:id", func(c *gin.Context) {
		//fmt.Println("pass")
		c.JSON(200, "admin pass")
	})

	roleUser := r.Use(roles([]string{"3"}))
	roleUser.GET("/test2/:id", func(c *gin.Context) {
		c.JSON(200, "admin pass")
	})

	r.Run(":8080")
}

func roles(roles []string) gin.HandlerFunc {
	return func(c *gin.Context) {
		db := initDB()
		userId := c.Param("id")

		result := map[string]interface{}{}
		err := db.Table("role_has_model").Where("user_id", userId).Where("role_id in ?", roles).Take(result).Error
		if err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, "You cannot Access!")
		} else {
			c.Next()
		}
	}
}

func initDB() *gorm.DB {
	dsn := "root@tcp(localhost:3306)/go_permission"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic(err)
	}
	return db

	//result := map[string]interface{}{}
	//db.Table("users").Take(result)
}
