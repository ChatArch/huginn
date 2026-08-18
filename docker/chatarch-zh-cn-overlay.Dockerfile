FROM ghcr.io/huginn/huginn-single-process:latest

# ChatArch zh-CN overlay image.
# Keep the upstream runtime/dependencies unchanged and overlay only localization files.
USER root

COPY --chown=1001:0 config/application.rb /app/config/application.rb
COPY --chown=1001:0 config/locales/zh-CN.yml /app/config/locales/zh-CN.yml
COPY --chown=1001:0 config/locales/devise.zh-CN.yml /app/config/locales/devise.zh-CN.yml
COPY --chown=1001:0 app/views/devise/sessions/new.html.erb /app/app/views/devise/sessions/new.html.erb
COPY --chown=1001:0 app/views/devise/shared/_links.html.erb /app/app/views/devise/shared/_links.html.erb
COPY --chown=1001:0 app/views/devise/passwords/new.html.erb /app/app/views/devise/passwords/new.html.erb
COPY --chown=1001:0 app/views/devise/unlocks/new.html.erb /app/app/views/devise/unlocks/new.html.erb
COPY --chown=1001:0 app/views/devise/registrations/new.html.erb /app/app/views/devise/registrations/new.html.erb
COPY --chown=1001:0 app/views/layouts/_navigation.html.erb /app/app/views/layouts/_navigation.html.erb
COPY --chown=1001:0 app/views/agents/index.html.erb /app/app/views/agents/index.html.erb
COPY --chown=1001:0 app/views/scenarios/index.html.erb /app/app/views/scenarios/index.html.erb
COPY --chown=1001:0 app/views/events/index.html.erb /app/app/views/events/index.html.erb

# Avoid stale compiled Ruby cache for overwritten files.
RUN rm -rf /app/tmp/cache/bootsnap* /app/tmp/cache/assets/* || true

USER 1001
