import pool from "../db/dbConnection";

var dataService = {

    handleGetMembers(data, callback) {
        try {
            var sql = 'select a.member_id,a.member_name,a.login,a.avatar_url,coalesce(b.following_count,0) as "following",coalesce(c.followers_count,0) as "followers" from public."tbl_members" a left join(select follower_id as follower,coalesce(count(follower_id),0) as following_count from public."tbl_followers" group by follower_id) as b on a.member_id = b.follower left join(select followers_id, coalesce(count(followers_id),0) as "followers_count" from public."tbl_followers" group by followers_id) as c on a.member_id = c.followers_id join public."M_org" d on a.org_id = d.org_id where LOWER(d.org_name) = \'' + data + '\'order by coalesce(c.followers_count,0) desc;';
            pool.connect(function (err, client, done) {
                if (err) {
                    callback(err);
                } else {
                    client.query(sql, callback);
                    client.release();
                }

            });

        } catch (e) {
            console.log("Exception in handleGetMembers : " + e);
        }
    },
    handleGetComments(data, callback) {
        try {
            var sql = 'select a.comments from public.tbl_comments a join public."M_org" b on a.org_id = b.org_id where lower(b.org_name) = \'' + data + '\'and a.is_available = true;';
            pool.connect(function (err, client, done) {
                if (err) {
                    callback(err);
                } else {
                    client.query(sql, callback);
                    client.release();
                }

            });

        } catch (e) {
            console.log("Exception in handleGetComments : " + e);
        }
    }
};

export default dataService;