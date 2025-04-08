
sleep 5 
/usr/bin/mc alias set ${MINIO_ALIAS} ${MINIO_URL} ${MINIO_ROOT_USER} ${MINIO_ROOT_PASSWORD}

/usr/bin/mc mb ${MINIO_ALIAS}/landing-bucket
/usr/bin/mc mb ${MINIO_ALIAS}/processed-bucket 

/usr/bin/mc admin user add ${MINIO_ALIAS} ${MINIO_CSURA_INTERNAL_USERNAME} ${MINIO_CSURA_INTERNAL_PASSWORD}  
/usr/bin/mc admin policy create ${MINIO_ALIAS} read-write-policy /policies/read-write-policy.json
/usr/bin/mc admin policy attach ${MINIO_ALIAS} read-write-policy --user ${MINIO_CSURA_INTERNAL_USERNAME}
/usr/bin/mc admin user svcacct add --access-key "${MINIO_CSURA_INTERNAL_SERVICE_ACCESS_KEY}" --secret-key "${MINIO_CSURA_INTERNAL_SERVICE_SECRET_KEY}" \
    --policy "/policies/read-write-policy.json" \
    ${MINIO_ALIAS} ${MINIO_CSURA_INTERNAL_USERNAME}
exit 0;

