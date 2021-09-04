import {createApp} from "./create_mini_server.ts"
import {superdeno} from "https://deno.land/x/superdeno@4.4.0/mod.ts"

const app = createApp();

Deno.test('should GET /mini access to return status code 200 and "hello anonymous"', async () => {
  await superdeno(app.handle.bind(app)).get('/mini').expect('hello anonymous')
});