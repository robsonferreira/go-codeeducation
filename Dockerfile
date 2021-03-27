FROM golang:1.14.3-alpine AS build
COPY ./src/app.go .
RUN go build app.go

FROM scratch AS bin
COPY --from=build /go/app .
CMD [ "./app" ]