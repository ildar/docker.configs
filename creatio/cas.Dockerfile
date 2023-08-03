FROM mcr.microsoft.com/dotnet/sdk:6.0 AS base
EXPOSE 5000 5002
RUN apt-get update && \
apt-get -y --no-install-recommends install \
libgdiplus \
libc6-dev && \
apt-get clean all && \
rm -rf /var/lib/apt/lists/* /var/cache/apt/*
WORKDIR /app
COPY . ./
FROM base AS final
WORKDIR /app
ENV ASPNETCORE_ENVIRONMENT Development
ENV TZ Etc/GMT+6
ENV COMPlus_ThreadPool_ForceMinWorkerThreads 100
ENTRYPOINT ["dotnet", "Terrasoft.WebHost.dll"]

