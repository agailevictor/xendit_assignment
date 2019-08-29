import pool from "../db/dbConnection";

var dataService = {

    handleGetMembers(data, callback) {
        try {
            var sql = 'select a.member_id,a.member_name,a.login,a.avatar_url,coalesce(b.following_count,0) as "following",coalesce(c.followers_count,0) as "followers" from public."tbl_members" a left join(select follower_id as follower,coalesce(count(follower_id),0) as following_count from public."tbl_followers" group by follower_id) as b on a.member_id = b.follower left join(select followers_id, coalesce(count(followers_id),0) as "followers_count" from public."tbl_followers" group by followers_id) as c on a.member_id = c.followers_id join public."M_org" d on a.org_id = d.org_id where LOWER(d.org_name) = \'' + data + '\'order by coalesce(c.followers_count,0) desc;';
            pool.connect(function (err, client, done) {
                if (err) {
                    console.error('Error connecting to pg server' + err.stack);
                    callback(err);
                } else {
                    console.log('Connection established with pg db server');

                    client.query(sql, callback);
                    client.release();
                }

            });

        } catch (e) {
            console.log("Exception in handleGetMembers : " + e);
        }
    }
};

export default dataService;