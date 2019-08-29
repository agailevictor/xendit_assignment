import dataService from "../services/service";

var dataController = {
    getMembers(req, res) {
        if (req.params && req.params.org !== '') {
            var QueryStringValue = req.params.org.toLocaleLowerCase();
            dataService.handleGetMembers(QueryStringValue, function (err, rows) {
                if (err) {
                    res.status(400).send(err);
                }
                else {
                    res.status(200).json({ data: rows.rows });
                }
            });

        } else {
            res.status(400).send("Search value cannot be empty");
        }
    }
};

export default dataController;