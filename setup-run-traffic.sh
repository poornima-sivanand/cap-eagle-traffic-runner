OPENSHIFT_NAMESPACE=your_namespace;
THROWAWAY_PW="something_unique";

local output=$(oc whoami 2>&1)
if echo "$output" | grep 'You must be logged in to the server'; then
    echo -e \\n"Not connected to OpenShift.\nIn your OpenShift Web Console, upper right corner, click on the down arrow next to user name. From the menu, select 'Copy Login Command'.\nPaste the buffer contents into this terminal and hit [ENTER]."\\n
    exit 1
fi

if echo "$OPENSHIFT_NAMESPACE" | grep 'your_namespace'; then
    echo -e \\n"OPENSHIFT_NAMESPACE is required.\nSet the value to a valid OpenShift project for which you have edit permissions."\\n
    exit 1
fi

if echo "$THROWAWAY_PW" | grep 'something_unique'; then
    echo -e \\n"THROWAWAY_PW is required.\nSet the value to something random and unique.\nEven though we're not using it, we don't want to leave a vulnerability open."\\n
    exit 1
fi

oc project ${OPENSHIFT_NAMESPACE};
oc run cap-traffic-runner --image=docker-registry.default.svc:5000/openshift/mongodb --env="MONGODB_ADMIN_PASSWORD=${THROWAWAY_PW}" -n ${OPENSHIFT_NAMESPACE};
oc describe dc/cap-traffic-runner;
CAP_TRAFFIC_RUNNER_TARGET__IBM_MAIN_PAGE="https://cap-ibm-dev.clouddiscovery-01dea2606d71f7a3540418b505a890bc-0002.mon01.containers.appdomain.cloud";
CAP_TRAFFIC_RUNNER_TARGET__IBM_RECENT_ACTIVITIES="https://cap-ibm-dev.clouddiscovery-01dea2606d71f7a3540418b505a890bc-0002.mon01.containers.appdomain.cloud/news;currentPage=1;pageSize=10;sortBy=-dateAdded;ms=1581288481967";
CAP_TRAFFIC_RUNNER_TARGET__IBM_RECENT_ACTIVITIES_PAGE_2="https://cap-ibm-dev.clouddiscovery-01dea2606d71f7a3540418b505a890bc-0002.mon01.containers.appdomain.cloud/news;currentPage=2;pageSize=10;sortBy=-dateAdded;ms=1581288517208";
CAP_TRAFFIC_RUNNER_TARGET__IBM_MAPS_SEARCH="https://cap-ibm-dev.clouddiscovery-01dea2606d71f7a3540418b505a890bc-0002.mon01.containers.appdomain.cloud/projects";
CAP_TRAFFIC_RUNNER_TARGET__IBM_MAPS_SEARCH_SCHOEN="https://cap-ibm-dev.clouddiscovery-01dea2606d71f7a3540418b505a890bc-0002.mon01.containers.appdomain.cloud/projects?applicant=SCHOEN%20-%20BLOCK%20QUARRY";
CAP_TRAFFIC_RUNNER_TARGET__IBM_ALL_PROJECT_LIST="https://cap-ibm-dev.clouddiscovery-01dea2606d71f7a3540418b505a890bc-0002.mon01.containers.appdomain.cloud/projects-list;currentPage=1;pageSize=10;sortBy=-datePosted;ms=1581288359648";
CAP_TRAFFIC_RUNNER_TARGET__IBM_PROJECT_SCHOEN="https://cap-ibm-dev.clouddiscovery-01dea2606d71f7a3540418b505a890bc-0002.mon01.containers.appdomain.cloud/p/436a1eee7d7ec466d7c5a95f/documents;currentPage=1;pageSize=10;sortBy=-datePosted;ms=1581287971811";
CAP_TRAFFIC_RUNNER_TARGET__IBM_PROJECT_SCHOEN_DOC_SMALL="https://cap-ibm-api-minio-oabrei-dev.clouddiscovery-01dea2606d71f7a3540418b505a890bc-0002.mon01.containers.appdomain.cloud/uploads/436a1eee7d7ec466d7c5a95f/8af9c55969218a0eba1faf16fa2dbddc.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=m4LUgGgm%2F20200209%2F%2Fs3%2Faws4_request&X-Amz-Date=20200209T225734Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=72f981a0489caedd91622de10261df954ced876e0baa9675b5ee55dfb28ada4f";
CAP_TRAFFIC_RUNNER_TARGET__IBM_PROJECT_SCHOEN_DOC_MEDIUM="https://cap-ibm-api-minio-oabrei-dev.clouddiscovery-01dea2606d71f7a3540418b505a890bc-0002.mon01.containers.appdomain.cloud/uploads/436a1eee7d7ec466d7c5a95f/30fcfbb41bebdfc6f4a909c1e5c3dfaf.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=m4LUgGgm%2F20200210%2F%2Fs3%2Faws4_request&X-Amz-Date=20200210T035334Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=1cb73fc7373d2df1d27a9b49f21d9052b5df1d2a9ccd5c81fdaa01d6e6af444c";
CAP_TRAFFIC_RUNNER_TARGET__IBM_PROJECT_SCHOEN_DOC_LARGE="https://cap-ibm-api-minio-oabrei-dev.clouddiscovery-01dea2606d71f7a3540418b505a890bc-0002.mon01.containers.appdomain.cloud/uploads/436a1eee7d7ec466d7c5a95f/fb0f9e6ac02e8d0a9552ddf2231175c6.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=m4LUgGgm%2F20200209%2F%2Fs3%2Faws4_request&X-Amz-Date=20200209T224400Z&X-Amz-Expires=432000&X-Amz-SignedHeaders=host&X-Amz-Signature=a7b198f9dd0b3435eb9da78e76a09227a132031b37a7cc22524625fb886052b3";

oc set env dc/cap-traffic-runner --overwrite \
URL1=${CAP_TRAFFIC_RUNNER_TARGET__IBM_MAIN_PAGE} \
URL2=${CAP_TRAFFIC_RUNNER_TARGET__IBM_RECENT_ACTIVITIES} \
URL3=${CAP_TRAFFIC_RUNNER_TARGET__IBM_RECENT_ACTIVITIES_PAGE_2} \
URL4=${CAP_TRAFFIC_RUNNER_TARGET__IBM_MAPS_SEARCH} \
URL5=${CAP_TRAFFIC_RUNNER_TARGET__IBM_MAPS_SEARCH_SCHOEN} \
URL6=${CAP_TRAFFIC_RUNNER_TARGET__IBM_ALL_PROJECT_LIST} \
URL7=${CAP_TRAFFIC_RUNNER_TARGET__IBM_PROJECT_SCHOEN} \
URL8=${CAP_TRAFFIC_RUNNER_TARGET__IBM_PROJECT_SCHOEN_DOC_SMALL} \
URL9=${CAP_TRAFFIC_RUNNER_TARGET__IBM_PROJECT_SCHOEN_DOC_MEDIUM} \
URL10=${CAP_TRAFFIC_RUNNER_TARGET__IBM_PROJECT_SCHOEN_DOC_LARGE};
