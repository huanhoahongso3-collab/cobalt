import { apiJSON } from "../sub/utils.js";
import { verifyStream } from "./manage.js";
import { streamAudioOnly, streamDefault, streamLiveRender } from "./types.js";

export default function(res, ip, id, hmac, exp, lang) {
    try {
        let streamInfo = verifyStream(ip, id, hmac, exp, process.env.streamSalt);
        if (!streamInfo.error) {
            if (streamInfo.isAudioOnly && streamInfo.type != "bridge") {
                streamAudioOnly(streamInfo, res);
            } else {
                switch (streamInfo.type) {
                    case "render":
                        streamLiveRender(streamInfo, res, lang);
                        break;
                    default:
                        streamDefault(streamInfo, res, lang);
                        break;
                }
            }
        } else {
            res.status(streamInfo.status).json(apiJSON(0, { t: streamInfo.error }).body);
        }
    } catch (e) {
        internalError(res)
    }
}
