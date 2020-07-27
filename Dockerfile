FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["NTierDocker/NTierDocker.csproj", "NTierDocker/"]
COPY ["NTierDocker.Core/NTierDocker.Core.csproj", "NTierDocker.Core/"]
RUN dotnet restore "NTierDocker/NTierDocker.csproj"
COPY . .
WORKDIR "/src/NTierDocker"
RUN dotnet build "NTierDocker.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "NTierDocker.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "NTierDocker.dll"]