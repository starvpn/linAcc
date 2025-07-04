package main

import (
    "net/http"

    "github.com/labstack/echo/v4"
)

func main() {
    e := echo.New()

    // Serve static files from the web directory
    e.Static("/", "web")

    e.GET("/api/ping", func(c echo.Context) error {
        return c.JSON(http.StatusOK, map[string]string{"message": "pong"})
    })

    e.Logger.Fatal(e.Start(":8080"))
}
