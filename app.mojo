from FireApi import Route, Server, Response, Request


@value
struct MyRoute(Route):
    var route: String
    var method: String

    fn func(self, request: Request) raises -> Response:
        return Response(
            status_code=200,
            body="Hello FireApi!",
        )

    fn get_method(self) -> String:
        return self.method

    fn get_route(self) -> String:
        return self.route


fn main() raises -> None:
    let app = Server()

    let main_route = MyRoute(
        route="/",
        method="GET",
    )

    app.run[MyRoute](route=main_route)
