FROM golang:alpine AS golang-build

WORKDIR /var/www

RUN go mod init fullcycle

COPY fullcycle.go .

RUN GOOS=linux go build ./fullcycle.go

FROM scratch

WORKDIR /var/www

COPY --from=golang-build /var/www/fullcycle .

CMD [ "./fullcycle" ]