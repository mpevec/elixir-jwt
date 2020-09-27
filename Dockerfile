FROM bitwalker/alpine-elixir:latest AS release_stage

# ---- VER 1 ----
# ARG SECRET
# ARG SECRET_FILE
# RUN mkdir $HOME/secrets
# RUN echo "$SECRET" > $HOME/secrets/$SECRET_FILE
# RUN chown -R default $HOME/secrets

COPY mix.exs .
COPY mix.lock .
RUN mix deps.get
RUN mix deps.compile

COPY config ./config
COPY lib ./lib
COPY test ./test

ENV MIX_ENV=prod
RUN mix release

FROM bitwalker/alpine-elixir:latest AS run_stage

COPY --from=release_stage $HOME/_build .
RUN chown -R default: ./prod
USER default
CMD ["./prod/rel/jwt_example/bin/jwt_example", "start"]