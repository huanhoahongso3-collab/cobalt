import { CobaltRequest } from "./request";
import { CobaltResponse } from "./response";

export interface CobaltAPIClient {
    request(data: CobaltRequest): Promise<CobaltResponse>;
    getBaseURL(): string | undefined;
    setBaseURL(baseURL: string): string;
}
