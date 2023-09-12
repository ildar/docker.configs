# Install Creatio server in containers

(I'm using `podman` instead of `docker`)
0. unzip the distro
   * add `ConnectionStrings.config` right there
   * move out the `db` folder
1. time docker build --net=host -f cas.Dockerfile -t creatio.server .
2. docker-compose run db
3. bring the `db` folder into the volume
4. time docker exec -it creatio-db-1 bash -c "pg_restore -U puser -d creatio /var/lib/postgresql/data/db/*.backup"
9. docker-compose up

### troubleshooting

* remember to install `cni-plugin-dnsname`

### refs

* [official docs](https://academy.creatio.com/docs/user/on_site_deployment/general_deployment_procedure/general_creatio_deployment_procedure)
