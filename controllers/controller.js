import dataService from "../services/service";
import empty from "../helpers/index"

var dataController = {
    getMembers(req, res) {
        if (req.params && !empty(req.params.org.trim())) {
            var QueryStringValue = req.params.org.trim().toLocaleLowerCase();
            dataService.handleGetMembers(QueryStringValue, function (err, rows) {
                if (err) {
                    res.status(400).send(err);
                }
                else {
                    res.status(200).json({ data: rows.rows, status: 'success' });
                }
            });

        } else {
            res.status(400).json({ error: 'Organisation name cannot be empty' });
        }
    },
    getComments(req, res) {
        if (req.params && !empty(req.params.org.trim())) {
            var QueryStringValue = req.params.org.trim().toLocaleLowerCase();
            dataService.handleGetComments(QueryStringValue, function (err, rows) {
                if (err) {
                    res.status(400).send(err);
                }
                else {
                    res.status(200).json({ data: rows.rows, status: 'success' });
                }
            });

        } else {
            res.status(400).json({ error: 'Organisation name cannot be empty' });
        }
    },
    postComments(req, res) {
        if (req.params && !empty(req.params.org.trim()) && req.body.comment && empty(req.body.comment.trim())) {
            var QueryStringValue = req.params.org.trim().toLocaleLowerCase();
            var comment = req.body.comment;
            dataService.handlePostComments(QueryStringValue, comment, function (err, rows) {
                if (err) {
                    res.status(400).send(err);
                }
                else {
                    res.status(200).json({ Message: 'Successfully added new comment!', status: 'success' });
                }
            });
            res.status(200);

        } else {
            res.status(400).json({ error: 'Missing fields' });
        }
    },
    deleteComments(req, res) {
        if (req.params && !empty(req.params.org.trim())) {
            var QueryStringValue = req.params.org.trim().toLocaleLowerCase();
            var comment = req.body.comment;
            dataService.handleDeleteComments(QueryStringValue, function (err, rows) {
                if (err) {
                    res.status(400).send(err);
                }
                else {
                    res.status(200).json({ Message: 'Successfully deleted the comments!', status: 'success' });
                }
            });
            res.status(200);

        } else {
            res.status(400).json({ error: 'Organisation name cannot be empty' });
        }
    }
};

export default dataController;