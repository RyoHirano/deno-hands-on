import {
  Application,
  helpers,
  Router,
} from "https://deno.land/x/oak@v7.7.0/mod.ts";

export function createApp(): Application {
  const app = new Application();
  const router = new Router();

  router.get("/mini", (ctx) => {
    const { name = "anonymous" } = helpers.getQuery(ctx);
    ctx.response.body = `hello ${name}`;
  });
  app.use(router.routes());
  app.use(router.allowedMethods())
  return app;
}
