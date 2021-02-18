FROM mcr.microsoft.com/dotnet/sdk:3.1 AS base
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
ENV PATH="${PATH}:DISABLE_AUTH=true:DB_ENGINE=sqlite:DOTNET_CLI_HOME=/tmp/DOTNET_CLI_HOME"
COPY . app/
WORKDIR /app
RUN dotnet build
WORKDIR /app/DotnetTemplate.Web
RUN npm install --legacy-peer-deps
RUN npm run build
EXPOSE 5000
CMD ["dotnet", "run"]