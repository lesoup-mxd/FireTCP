from python import PythonObject


struct Connection:
    var conn: PythonObject
    var addr: PythonObject

    fn __init__(inout self, connAddr: PythonObject) raises -> None:
        self.conn = connAddr[0]
        self.addr = connAddr[1]

    fn revieve_data(borrowed self, size: Int = 1024) raises -> String:
        let data = self.conn.recv(size).decode("utf-8")
        return str(data)

    fn send_all_data(
        borrowed self, response: Response, py: PythonObject
    ) raises -> None:
        let byte_response = py.bytes(response.body)
        _ = self.conn.send_all(byte_response)

    fn close(borrowed self) raises -> None:
        _ = self.conn.close()
